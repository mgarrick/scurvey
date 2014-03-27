require 'scurvey'

describe Scurvey do
  let(:key) { :key }
  let(:label) { 'Label' }

  context "survey" do
    it "accepts a key and label" do
      s = Scurvey.start key, label: label

      s.key.should == key
      s.label.should == label
    end

    it "does not require any parameters" do
      Scurvey.start.key.should be_nil
    end
  end

  context "question" do
    it "accepts a key and label" do
      question = Scurvey.start do |s|
        s.question key, label: label
      end.questions.first

      question.key.should == key
      question.label.should == label
    end

    it "does not require any parameters" do
      question = Scurvey.start do |s|
        s.question
      end.questions.first

      question.key.should be_nil
    end
  end

  context "answer" do
    it "accepts a key and label" do
      answer = Scurvey.start do |s|
        s.question do |q|
          q.answer key, label: label
        end
      end.questions.first.answers.first

      answer.key.should == key
      answer.label.should == label
    end

    it "does not require any parameters" do
      answer = Scurvey.start do |s|
        s.question do |q|
          q.answer
        end
      end.questions.first.answers.first

      answer.key.should be_nil
    end
  end
end
