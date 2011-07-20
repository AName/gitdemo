module SourceControl
  class AbstractRevision

    def number
      raise NotImplementedError, "number() not implemented by #{self.class}"
    end

    def author
      raise NotImplementedError, "author() not implemented by #{self.class}"
    end

    def time
      raise NotImplementedError, "time() not implemented by #{self.class}"
    end

    def ==(other)
      raise NotImplementedError, "time() not implemented by #{self.class}"
    end

    alias :eql? :==

    def inspect
      "#{self.class}:(#{number})"
    end

  end
end