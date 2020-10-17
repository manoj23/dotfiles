ip_change_mac_addr()
{
	if [ -n "$1" ] && [ -n "$2" ]; then
		local if=$1
		local mac_addr=$2

		sudo ip link set dev $if down
		sudo ip link set dev $if address $mac_addr
		sudo ip link set dev $if up
	fi
}
