require 'json'

module Scurvey
  class Submission
    class Export
      include Virtus.model
      
      attribute :survey
      attribute :submission

      def render
        JSON.generate(submission.attributes)
      end
    end
  end
end
