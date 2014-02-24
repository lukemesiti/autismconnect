Role.delete_all

['admin', 'professionals', 'parents'].each do |role|
  Role.find_or_create_by_name role
end