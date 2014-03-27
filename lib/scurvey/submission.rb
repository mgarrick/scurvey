module Scurvey
  class Submission
    include Virtus.model

    attribute :responses, Array
    attribute :survey
  end
end
