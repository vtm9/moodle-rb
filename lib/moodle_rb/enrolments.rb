module MoodleRb
  class Enrolments
    include HTTParty
    include Utility

    attr_reader :token
    STUDENT_ROLE_ID = 5

    def initialize(token, url)
      @token = token
      self.class.base_uri url
    end

    # required params:
    # user_id course_id
    def create(params)
      response = self.class.post(
        '/webservice/rest/server.php',
        query: query_hash('enrol_manual_enrol_users', token),
        body: {
          enrolments: {
            '0' => {
              userid: params[:user_id],
              courseid: params[:course_id],
              roleid: STUDENT_ROLE_ID
            }
          }
        }
      )
      check_for_errors(response)
      response.code == 200 && response.parsed_response.nil?
    end
  end
end
