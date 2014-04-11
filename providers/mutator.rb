def load_current_resource
  definition_directory = ::File.join(node.sensu.directory, "conf.d", "mutators")
  @definition_path = ::File.join(definition_directory, "#{new_resource.name}.json")
end

action :create do
  mutator = Sensu::Helpers.select_attributes(
    new_resource,
    %w[command timeout]
  )

  definition = {
    "mutators" => {
      new_resource.name => Sensu::Helpers.sanitize(mutator)
    }
  }

  f = sensu_json_file @definition_path do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
    content definition
  end

  new_resource.updated_by_last_action(f.updated_by_last_action?)
end

action :delete do
  f = sensu_json_file @definition_path do
    action :delete
  end

  new_resource.updated_by_last_action(f.updated_by_last_action?)
end
