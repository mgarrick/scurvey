require 'scurvey'

describe Scurvey::Submission::Export do
  let(:submission) { Scurvey::Submission.new }
  let(:export) { described_class.new(submission: submission) }
  describe :render do
    subject { JSON.parse(export.render) }

    it { should == {'responses' => [], 'survey' => nil} }
  end
end
