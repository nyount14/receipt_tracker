require 'test_helper'

class ReasonTest < ActiveSupport::TestCase

    test "reason should be valid" do
        @reason = Reason.new(option: "need")
        assert @reason.valid?
    end

    test "option should be unique" do
        @reason = Reason.new(option: "need")
        @reason.save
        @reason2 = Reason.new(option: "need")
        assert_not @reason2.valid?
    end

end