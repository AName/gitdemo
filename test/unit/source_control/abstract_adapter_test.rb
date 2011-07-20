require File.dirname(__FILE__) + '/../../test_helper'
require 'stringio'

class SourceControl::AbstractAdapterTest < Test::Unit::TestCase

  include FileSandbox

  def test_execute_with_error_log__handles_exceptions
    @adapter = SourceControl::AbstractAdapter.new
    in_total_sandbox do
      assert_raise(BuilderError) do
              @adapter.execute_with_error_log("xaswedf", @stderr)
            end
    end
  end

  def test_execute_with_error_log__shows_all_lines_of_multiline_exceptions
    @adapter = SourceControl::AbstractAdapter.new
    in_total_sandbox do
      assert_raises(BuilderError, /svn:.*svn:/m) do
              @adapter.execute_with_error_log("svn co file://foo/bar", @stderr)
            end
    end
  end

  def test_execute_with_error_log__handles_ExecutionError
    @adapter = SourceControl::AbstractAdapter.new
    in_total_sandbox do
      assert_raise(BuilderError) do
              @adapter.execute_with_error_log("xaswedf", @stderr)
            end
    end
  end
end