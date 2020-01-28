//eventually going to be a little more involced

var _shields_granted = 10 + sqr(energy_current)
show_debug_message(string("shield cast for " + string(_shields_granted)))
temporary_shields += _shields_granted
inhibitor_shields_granted = _shields_granted
inhibitor_shield_counter += energy_current*20