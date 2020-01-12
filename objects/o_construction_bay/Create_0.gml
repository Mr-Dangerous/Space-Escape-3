
gui_height = view_get_hport(0)
gui_width = view_get_wport(0)
resolution_scale = view_get_wport(0)/camera_get_view_width(view_camera[0])
rotation = 270

construction_bay_socket_offsets[0, 0] = round(128 * resolution_scale) //ship frame x
construction_bay_socket_offsets[0, 1] = round(170 * resolution_scale)// ship frame y
construction_bay_socket_offsets[1, 0] = round(16 * resolution_scale)//top left socket x
construction_bay_socket_offsets[1, 1] = round(16 * resolution_scale)//top left socket y
construction_bay_socket_offsets[2, 0] = round(16 * resolution_scale)//mid left socket x
construction_bay_socket_offsets[2, 1] = round(96 * resolution_scale)//mid left socket y
construction_bay_socket_offsets[3, 0] = round(16 * resolution_scale)//bot left socket x
construction_bay_socket_offsets[3, 1] = round(176 * resolution_scale)//bot left socket y
construction_bay_socket_offsets[4, 0] = round(176 * resolution_scale)//top right socket x
construction_bay_socket_offsets[4, 1] = round(16 * resolution_scale)//top right socket y
construction_bay_socket_offsets[5, 0] = round(176 * resolution_scale)//mid right socket x
construction_bay_socket_offsets[5, 1] = round(96 * resolution_scale)//mid right socket y
construction_bay_socket_offsets[6, 0] = round(176 * resolution_scale)//bot right socket x
construction_bay_socket_offsets[6, 1] = round(176 * resolution_scale)//bot right socket y

//generate construction bay string locations
construction_bay_string_offset[0, 0] = 0//name of frame offset from left x
construction_bay_string_offset[0, 1] = 0//name of frame offset from top y
construction_bay_string_offset[1, 0] = round((256/2) * resolution_scale) //Deploy button x offset
construction_bay_string_offset[1, 1] = round(232*resolution_scale) //deploy button y offset

//generate construction bay accetpable item locations
construction_bay_item_type[0] = module.frame
construction_bay_item_type[1] = module.weapon
construction_bay_item_type[2] = module.shields
construction_bay_item_type[3] = module.armor
construction_bay_item_type[4] = module.targeting
construction_bay_item_type[5] = module.ability
construction_bay_item_type[6] = module.power_plant



