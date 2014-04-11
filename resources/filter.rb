actions :create, :delete

attribute :attributes, :kind_of => Hash, :required => true
attribute :negate, :kind_of => [TrueClass, FalseClass]
attribute :owner, :kind_of => String, :default => node['sensu']['user']
attribute :group, :kind_of => String, :default => node['sensu']['group']
attribute :mode, :kind_of => [String, Integer], :default => 0640

def initialize(*args)
  super
  @action = :create
end
