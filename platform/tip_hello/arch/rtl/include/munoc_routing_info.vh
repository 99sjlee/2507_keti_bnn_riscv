case(NETWORK_TYPE)
	`FORWARD_NETWORK:
		case(ROUTER_ID)
			`ROUTER_ID_I_SYSTEM_ROUTER:
				case(target_node)
					`NODE_ID_I_SNIM_U_BNN_TOP_SLAVE_SLAVE: routing_info = 6'b 000001;
					`NODE_ID_I_SNIM_I_SYSTEM_SRAM_NO_NAME: routing_info = 6'b 000010;
					`NODE_ID_I_SNIM_COMMON_PERI_GROUP_NO_NAME: routing_info = 6'b 000100;
					`NODE_ID_I_SNIM_EXTERNAL_PERI_GROUP_NO_NAME: routing_info = 6'b 001000;
					`NODE_ID_I_SNIM_PLATFORM_CONTROLLER_NO_NAME: routing_info = 6'b 010000;
					`NODE_ID_DEFAULT_SLAVE: routing_info = 6'b 100000;
				endcase
			`ROUTER_ID_I_USER_ROUTER:
				case(target_node)
					`NODE_ID_I_SNIM_I_USER_DDR4_NO_NAME: routing_info = 8'b 00000001;
					`NODE_ID_I_SNIM_I_SYSTEM_DDR_NO_NAME: routing_info = 8'b 00000010;
					`NODE_ID_I_SNIM_U_BNN_TOP_SLAVE_SLAVE: routing_info = 8'b 00000100;
					`NODE_ID_I_SNIM_I_SYSTEM_SRAM_NO_NAME: routing_info = 8'b 00000100;
					`NODE_ID_I_SNIM_COMMON_PERI_GROUP_NO_NAME: routing_info = 8'b 00000100;
					`NODE_ID_I_SNIM_EXTERNAL_PERI_GROUP_NO_NAME: routing_info = 8'b 00000100;
					`NODE_ID_I_SNIM_PLATFORM_CONTROLLER_NO_NAME: routing_info = 8'b 00000100;
					`NODE_ID_DEFAULT_SLAVE: routing_info = 8'b 00000100;
				endcase
		endcase
	`BACKWARD_NETWORK:
		case(ROUTER_ID)
			`ROUTER_ID_I_SYSTEM_ROUTER:
				case(target_node)
					`NODE_ID_I_MNIM_I_MAIN_CORE_INST: routing_info = 4'b 0001;
					`NODE_ID_I_MNIM_I_MAIN_CORE_DATA: routing_info = 4'b 0001;
					`NODE_ID_I_MNIM_U_BNN_TOP_MASTER_MASTER: routing_info = 4'b 0001;
					`NODE_ID_I_MNIM_PLATFORM_CONTROLLER_MASTER: routing_info = 4'b 0001;
				endcase
			`ROUTER_ID_I_USER_ROUTER:
				case(target_node)
					`NODE_ID_I_MNIM_I_MAIN_CORE_INST: routing_info = 4'b 0001;
					`NODE_ID_I_MNIM_I_MAIN_CORE_DATA: routing_info = 4'b 0010;
					`NODE_ID_I_MNIM_U_BNN_TOP_MASTER_MASTER: routing_info = 4'b 0100;
					`NODE_ID_I_MNIM_PLATFORM_CONTROLLER_MASTER: routing_info = 4'b 1000;
				endcase
		endcase
endcase