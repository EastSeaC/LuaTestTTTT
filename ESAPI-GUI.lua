--- Client
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 86184.
--- DateTime: 2023/5/5 16:00
---

require('triggers')
local scene_prop_id = 2576
local color_white = 0xffffff
local StoreMouseXYPosIndex = 30
local WidgetList = {}



local ModifyAgentGUI = {
    id = 'ModifyAgentGUI',
    flags = { prsntf_manual_end_only },
    mesh = 0,
    triggers = {
        [ti_on_presentation_load] = function()
            game.presentation_set_duration(9999999)
            game.set_fixed_point_multiplier(1000)
            local overlay = game.create_mesh_overlay(0, game.const.meshs.mesh_mp_ingame_menu)

            local pos = game.pos.new({ o = { x = 10, y = 300 } })
            game.overlay_set_position(overlay, pos)

            local overlay_id = game.create_text_overlay(0, '', tf_scrollable_style_2)
            game.position_set_x(1, 10)
            game.position_set_y(1, 80)
            game.overlay_set_position(overlay_id, 1)
            game.position_set_x(1, 500)
            game.position_set_y(1, 500)
            game.overlay_set_area_size(overlay_id, 1)

            local pos_x = 30
            local pos_y = 600


        end,
        [ti_on_presentation_run] = function()
            local is_clicked = game.key_clicked(key_escape)
            if is_clicked then
                game.presentation_set_duration(0)
            end
        end,
        [ti_on_presentation_event_state_change] = function()
            local object = game.store_trigger_param_1()
            local val = game.store_trigger_param_2()


        end,
    }
}

local IsStartDrawRectangle = false
local StartPos = 0
local ModifyTroopGUI = {
    id = 'ModifyTroopGUITest',
    flags = { prsntf_manual_end_only },
    mesh = 0,
    triggers = {
        [ti_on_presentation_load] = function()
            game.presentation_set_duration(9999999)
            game.set_fixed_point_multiplier(1000)

            local overlay_id = game.create_mesh_overlay(0, game.const.meshes.mesh_mp_ingame_menu)
            local pos_index = 3
            game.position_set_x(pos_index, 10)
            game.position_set_y(pos_index, 80)
            game.overlay_set_position(overlay_id, pos_index)
            game.position_set_x(pos_index, 500)
            game.position_set_y(pos_index, 1000)
            game.overlay_set_size(overlay_id, pos_index)

            overlay_id = game.create_text_overlay(0, '', tf_scrollable_style_2)
            game.position_set_x(pos_index, 20)
            game.position_set_y(pos_index, 20)
            game.overlay_set_position(overlay_id, pos_index)
            game.position_set_x(pos_index, 600)
            game.position_set_y(pos_index, 500)
            game.overlay_set_area_size(overlay_id, pos_index)
            game.set_container_overlay(overlay_id)

            local size_pos = 2
            game.position_set_x(size_pos, 900)
            game.position_set_y(size_pos, 900)
            local cur_x = 10
            local cur_y = 480

            game.set_container_overlay(-1)

        end,
        [ti_on_presentation_run] = function()
            --game.presentation_set_duration(0)

            local is_clicked = game.key_is_down(key_escape)
            if is_clicked then
                game.presentation_set_duration(0)
            end

        end
    }
}
local GUIID_ModifyTroopGUI = game.addPrsnt(ModifyTroopGUI)
function OpenGUI()
    local is_clicked = game.key_clicked(key_v)
    if is_clicked then
        game.start_presentation(GUIID_ModifyTroopGUI)
    end
end


