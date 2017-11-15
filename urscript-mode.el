
;; define several category of keywords
(setq urscript-keywords '("True" "local" "global" "thread" "join" "kill" "enter_critical" "exit_critical" "False" "halt" "break" "continue" "def" "while" "if" "else" "for" "return" "end" "elif") )
(setq urscript-types '("p"))
(setq urscript-operators '("and" "or" "xor" "not"))
;;(setq mylsl-events '("at_rot_target" "at_target" "attach"))
(setq urscript-builtin-functions '("reset_revolution_counter" "servoc" "servoj" "set_conveyor_tick_count" "set_pos" "stop_conveyor_tracking" "stopj" "stopl" "teach_mode" "Track_conveyor_circular" "track_conveyor_linear" "force" "get_actual_joint_positions" "get_actual_joint_speeds" "get_actual_tcp_pose" "get_actual_tcp_speed" "get_actual_tool_flange_pose" "get_controller_temp" "get_inverse_kin" "get_joint_temp" "get_joint_torques" "get_target_joint_poisitions" "get_target_joint_speeds" "get_target_tcp_pose" "get_target_tcp_speed" "get_tcp_force" "get_tool_accelerometer_reading" "get_tool_current" "is_steady" "is_within_safety_limits" "popup" "powerdown" "set_gravity" "set_payload" "set_payload_cog" "set_payload_mass" "set_tcp" "sleep" "sync" "acos" "asin" "atan" "atan2" "binary_list_to_integer" "ceil" "cos" "d2r" "floor" "get_list_length" "integer_to_binary_list" "interpolate_pose" "length" "log" "norm" "point_dist" "pose_add" "pose_dist" "pose_inv" "pose_sub" "pose_trans" "pow" "r2d" "random" "rotvec2rpy" "rpy2rotvec" "sin" "sqrt" "tan" "get_analog_in" "get:analog_out" "get_configurable_digital_in" "get_configurable_digital_out" "get_digital_in" "get_digital_out" "get_euromap_input" "get_euromap_output" "get_flag" "get_standard_analog_in" "get_standard_analog_out" "get_standard_digital_in" "get_standard_digital_out" "get_tool_analog_in" "get_tool_digital_in" "get_tool_digital_in" "get_tool_digital_out" "modbus_add_signal" "modbus_delete_signal" "modbus_get_signal_status" "modbus_send_custom_command" "modbus_set_output_register" "modbus_set_output_signal" "modbus_set_runstate_dependent_choice" "modbus_set_signal_update_frequency" "read_input_boolean_register" "read_input_float_register" "read_input_integer_register" "read_output_boolean_register" "read_output_float_register" "read_output_integer_register" "read_port_bit" "read_port_register" "rtde_set_watchdog" "set_analog_inputrange" "set_analog_out" "set_analog_outputdomain" "set_configurable_digital_out" "set_digital_out" "set_euromap_output" "set_euromap_runstate_dependent_choice" "set_flag" "set_runstate_configurable_digital_output_to_value" "set_runstate_gp_boolean_output_to_value" "set_runstate_standard_analog_output_to_value" "set_runstate_standard_digital_output_to_value" "set_runstate_tool_digital_output_to_value" "set_standard_analog_input_domain" "set_standard_analog_out" "set_standard_digital_out" "set_tool_analog_input_domain" "set_tool_digital_out" "set_tool_voltage" "socket_close" "socket_get_var" "socket_open" "socket_read_ascii_float" "socket_read_binary_integer" "socket_read_byte_list" "socket_read_line" "socket_read_string" "socket_send_byte" "socket_send_int" "socket_send_line" "socket_send_string" "socket_set_var" "write_output_boolean_register" "write_output_float_register" "write_output_integer_register" "write_port_bit" "write_port_register" "position_deviation_warning" "get_conveyor_tick_count" "freedrive_mode" "force_mode" "end_teach_mode" "end_freedrive_mode" "end_force_mode" "conveyor_pulse_decode" "speedj" "speedl" "rpc_factory" "popup" "set_tcp" "movej" "movel" "movec" "movep" "textmsg" "pose_add" "pose_sub" "pose_trans" "sleep" "get_standard_digital_in" "set_too_digital_out"))

;; generate regex string for each category of keywords
(setq urscript-keywords-regexp (regexp-opt urscript-keywords 'words))
(setq urscript-type-regexp (regexp-opt urscript-types 'words))
(setq urscript-operators-regexp (regexp-opt urscript-operators 'words))
(setq urscript-builtin-functions-regexp (regexp-opt urscript-builtin-functions 'words))
;;(setq mylsl-event-regexp (regexp-opt mylsl-events 'words))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq urscript-font-lock-keywords
      `(
        (,urscript-builtin-functions-regexp . font-lock-builtin-face)
        (,urscript-keywords-regexp . font-lock-keyword-face)
        (,urscript-operators-regexp . font-lock-operators-face)
        (,urscript-type-regexp . font-lock-type-face)
        ;; note: order above matters, because once colored, that part won't change.
        ;; in general, longer words first
        ))

;;;###autoload
(define-derived-mode urscript-mode python-mode "urscript mode"
  "Major mode for editing URScript (Universal Robots Script Language)…"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((urscript-font-lock-keywords))))

;; clear memory. no longer needed
(setq urscript-keywords nil)
(setq urscript-types nil)
;;(setq urscript-constants nil)
;;(setq urscript-events nil)
(setq urscript-functions nil)

;; clear memory. no longer needed
(setq urscript-keywords-regexp nil)
(setq urscript-types-regexp nil)
;;(setq urscript-constants-regexp nil)
;;(setq urscript-events-regexp nil)
(setq urscript-functions-regexp nil)

;; add the mode to the `features' list
(provide 'urscript-mode)

;;; urscript-mode.el ends here
