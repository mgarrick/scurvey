module Scurvey
  class Submission
    include Virtus.model

    attribute :responses, Hash
  end
end
