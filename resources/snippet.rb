actions :create, :delete

attribute :content, :kind_of => Hash, :required => true
attribute :owner, :kind_of => String, :default => node['sensu']['user']
attribute :group, :kind_of => String, :default => node['sensu']['group']
attribute :mode, :kind_of => [String, Integer], :default => 0640

def initialize(*args)
  super
  @action = :create
end
