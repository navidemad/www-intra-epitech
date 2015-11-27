module Crawlers

  class Epitech

    require 'net/http'
    require 'json'
    require 'upsert'

    def initialize
      @http = Net::HTTP.new 'intra.epitech.eu', 443
      @http.use_ssl = true
    end

    def getJson(url, options={})
      JSON.parse @http.get(url, options).body.gsub!("// Epitech JSON webservice ...\n", "")
    end

    def authenticate!(autologinPath)
      response = @http.get autologinPath
      response_cookies = response.get_fields 'set-cookie'
      cookies_array = response_cookies.collect { |cookie| cookie.split('; ').first }
      @cookies = cookies_array.join('; ')
      self
    end

    def fetchLogins!
      attrs = getJson("/user/complete/?format=json", { 'Cookie' => @cookies })
      Upsert.batch(Student.connection, Student.table_name) do |upsert|
        attrs.map { |row| upsert.row(login: row['login']) }
      end
    end

    def crawlLogin!(login)
      attrs = getJson("/user/#{login}/?format=json", { 'Cookie' => @cookies })
      ActiveRecord::Base.transaction do
        student = Student.where(login: login).first_or_create
        puts "userid##{student.id} | /user/#{login}"
        attrs['gpa'].to_a.map { |row| student.student_gpas.where(student: student, key: row['cycle'], value: row['gpa']).first_or_create }
        attrs['userinfo'].to_a.map { |key,row| student.student_extras.where(student: student, key: key, value: row['value']).first_or_create }
        attrs['groups'].to_a.map { |row| student.student_groups.where(student: student, key: row['name'], value: row['title']).first_or_create }
        attrs.delete_if { |k,v| !student.attributes.keys.member?(k.to_s) }
        attrs.merge!(crawled_at: DateTime.now)
        student.update_attributes(attrs)
      end
    end

  end

end
