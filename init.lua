diy_trade = {}
print(tostring('sdcscsdcsdcsdc'))
-- diy_trade.new_hand = function()
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 0,
		groupcaps = {
			fleshy = {times={[2]=2.00, [3]=1.00}, uses=0, maxlevel=1},
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=7.00,[2]=4.00,[3]=1.40}, uses=0, maxlevel=3},
		}
	},
	on_use = function(itemstack, user, pointed_thing)
		print(dump(itemstack:get_name()))
		if pointed_thing.type == 'object' then
			if pointed_thing.ref:is_player() then
			print(tostring(pointed_thing.ref:is_player()))
			diy_trade.handle_inv(user,pointed_thing.ref)
			end
		end
		for i , v in pairs(pointed_thing) do
		print(tostring(i))
		print(tostring(v))
		end
	end,
})
-- end



diy_trade.handle_inv = function(player1,player2)


	local player1Name = player1:get_player_name()
	local player2Name = player2:get_player_name()
	local inv = minetest.create_detached_inventory(player1Name .. 'to' .. player2Name)
	inv:set_size("main", 1)
	local easy_trading = 'size[8,5]'
	..'list[current_player;main;0,0;8,4]'
	..'list[detached:' .. player1Name .. 'to' .. player2Name..';main;5,5;1,1]'
	minetest.show_formspec(player1Name,'easy_trading',easy_trading)
	minetest.show_formspec(player2Name,'easy_trading',easy_trading)

end


minetest.after(1,function(player)
minetest.override_item("", {
	on_use = function(itemstack, user, pointed_thing)
		print(tostring('ciao'))
	end
})
local hand = minetest.registered_items[""]
hand.on_use = 'ciao'
print(dump(hand))
hand.on_use = function(itemstack, user, pointed_thing)
		print(tostring('ciao'))
	end
print(dump(hand))
end)

