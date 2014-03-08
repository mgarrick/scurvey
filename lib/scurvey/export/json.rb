module Scurvey
  module Export
    class JSON
      def initialize(survey)
        @survey = survey
      end

      def render
        Jbuilder.encode do |json|
          json.survey do
            json.key @survey.key
            json.label @survey.label

            if @survey.questions.present?
              json.questions @survey.questions do |question|
                json.key question.key
                json.label question.label

                json.answers question.answers do |answer|
                  json.key answer.key
                  json.label answer.label
                end
              end
            end
          end
        end
      end
    end
  end
end
