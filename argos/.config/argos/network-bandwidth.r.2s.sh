#!/bin/bash

if=$(ip route | awk '/^default/ { print $5 ; exit }')

test -d /sys/class/net/$if || echo "<txt>no $if</txt><tool>No statistics for $i</tool>"


		prx=$(cat /sys/class/net/$if/statistics/rx_bytes)
		ptx=$(cat /sys/class/net/$if/statistics/tx_bytes)
		sleep 1
		crx=$(cat /sys/class/net/$if/statistics/rx_bytes)
		ctx=$(cat /sys/class/net/$if/statistics/tx_bytes)

		brx=$(($crx - $prx))
		btx=$(($ctx - $ptx))

		human_bandwidth () {
			bandwidth=$1
			p=0
			while [ "$bandwidth" -gt "1024" -a "$p" -le "3" ] ; do
				bandwidth=$(($bandwidth/1024))
				p=$(($p+1))
			done
			case $p in
				0)
				bandwidth="$bandwidth B/s"
				;;
				1)
				bandwidth="$bandwidth KB/s"
				;;
				2)
				bandwidth="$bandwidth MB/s"
				;;
			esac
			echo $bandwidth
		}

		rx=$(human_bandwidth $brx)
		tx=$(human_bandwidth $btx)

		if [ -n "$(  ip link | grep wg0 )" ]
		then
			vpn=★
		fi


		echo "$vpn   ↓  $rx  ↑   $tx "
		echo "---"
		echo "Bandwidth on interface $if"
