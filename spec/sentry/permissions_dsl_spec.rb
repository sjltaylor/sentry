require 'spec_helper'

describe Sentry::PermissionsDsl do
  describe '#allow' do
    let(:klass) { Class.new.extend(Sentry::PermissionsDsl) }
    it 'defines a permissions predicate which takes any arguments and returns true' do
      klass.allow(:service)
      instance = klass.new
      instance.methods.should include :allow_service?
      method = instance.method(:allow_service?)
      method.parameters[0][0].should == :rest
    end
  end
end