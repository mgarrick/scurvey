class Scurvey
  class Answer
    include Virtus.model

    attribute :key, Symbol
    attribute :label, String

    def method_missing(method_name, *args, &block)
      raise "No such method #{method_name} on #{self.class.name}."
    end
  end
end
