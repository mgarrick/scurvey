require 'scurvey'

describe Scurvey::Submission do
  it "accepts a hash of responses" do
    described_class.new(responses: [])
  end

  it "accepts a survey of any class" do
    described_class.new(survey: double(:survey))
  end
end
