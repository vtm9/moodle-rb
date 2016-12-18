require 'spec_helper'

describe MoodleRb::Enrolments do
  let(:url) { ENV['MOODLE_URL'] || 'localhost' }
  let(:token) { ENV['MOODLE_TOKEN'] || '' }
  let(:enrolment_moodle_rb) { MoodleRb.new(token, url).enrolments }

  describe '#create', vcr: {
    match_requests_on: [:headers], record: :once
  } do
    let(:params) do
      {
        user_id: 3,
        course_id: 8
      }
    end
    let(:result) { enrolment_moodle_rb.create(params) }

    specify do
      expect(result).to eq true
    end

    context 'when user or course id is invalid' do
      let(:params) do
        {
          user_id: 9999,
          course_id: 9999
        }
      end

      specify do
        expect { result }.to raise_error(
          MoodleRb::MoodleError,
          'Invalid parameter value detected'
        )
      end
    end
  end
end
