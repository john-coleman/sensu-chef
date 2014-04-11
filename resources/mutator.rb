actions :create, :delete

attribute :command, :kind_of => String, :required => true
attribute :timeout, :kind_of => Integer
attribute :owner, :kind_of => String, :default => node['sensu']['user']
attribute :group, :kind_of => String, :default => node['sensu']['group']
attribute :mode, :kind_of => [String, Integer], :default => 0640

def initialize(*args)
  super
  @action = :create
end
