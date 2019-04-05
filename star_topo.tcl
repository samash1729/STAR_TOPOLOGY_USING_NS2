#Create a simulator object
set ns [new Simulator]

#Open file for nam tracing
set nf [open out20.nam w]
$ns namtrace-all $nf

#Set up different colors for dataflow
$ns color 1 Red
$ns color 2 Blue
$ns color 3 Green
$ns color 4 Yellow
$ns color 5 Violet 
$ns color 6 Pink
$ns color 7 Brown
$ns color 8 White

#Define a 'finish' procedure
proc finish {} {
global ns nf
$ns flush-trace
#close the trace file
close $nf
#Execute nam on the trace file
exec nam out20.nam &
exit 0 }

#Create Nodes for the simulation
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]

#Create a duplex link between the links
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n0 $n3 1Mb 10ms DropTail
$ns duplex-link $n0 $n4 1Mb 10ms DropTail
$ns duplex-link $n0 $n5 1Mb 10ms DropTail
$ns duplex-link $n0 $n6 1Mb 10ms DropTail
$ns duplex-link $n0 $n7 1Mb 10ms DropTail
$ns duplex-link $n0 $n8 1Mb 10ms DropTail

#Define TCP agent
set tcp [new Agent/TCP]
$tcp set class_ 1
set tcpsink [new Agent/TCPSink]
$ns attach-agent $n0 $tcp
$ns attach-agent $n1 $tcpsink
$ns connect $tcp $tcpsink
$tcp set f_id 1
set tcp1 [new Agent/TCP]
$tcp1 set class_ 2
set tcpsink1 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp1
$ns attach-agent $n2 $tcpsink1
$ns connect $tcp1 $tcpsink1
$tcp1 set f_id 2
set tcp2 [new Agent/TCP]
$tcp2 set class_ 3
set tcpsink2 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp2
$ns attach-agent $n3 $tcpsink2
$ns connect $tcp2 $tcpsink2
$tcp2 set f_id 3
set tcp3 [new Agent/TCP]
$tcp3 set class_ 4
set tcpsink3 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp3
$ns attach-agent $n4 $tcpsink3
$ns connect $tcp3 $tcpsink3
$tcp3 set f_id 4
set tcp4 [new Agent/TCP]
$tcp4 set class_ 5
set tcpsink4 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp4
$ns attach-agent $n5 $tcpsink4
$ns connect $tcp4 $tcpsink4
$tcp4 set f_id 5
set tcp5 [new Agent/TCP]
$tcp5 set class_ 6
set tcpsink5 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp5
$ns attach-agent $n6 $tcpsink5
$ns connect $tcp5 $tcpsink5
$tcp5 set f_id 6
set tcp6 [new Agent/TCP]
$tcp6 set class_ 7
set tcpsink6 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp6
$ns attach-agent $n7 $tcpsink6
$ns connect $tcp6 $tcpsink6
$tcp6 set f_id 7
set tcp7 [new Agent/TCP]
$tcp7 set class_ 8
set tcpsink7 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp7
$ns attach-agent $n8 $tcpsink7
$ns connect $tcp7 $tcpsink7
$tcp7 set f_id 8

#Define FTP Application
set ftp [new Application/FTP]
$ftp attach-agent $tcp
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp5
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
set ftp7 [new Application/FTP]
$ftp7 attach-agent $tcp7


#Labelling the nodes
$ns at 0.0 "$n0 label Router1"
$ns at 0.0 "$n1 label Client1"
$ns at 0.0 "$n2 label Client2"
$ns at 0.0 "$n3 label Client3"
$ns at 0.0 "$n4 label Client4"
$ns at 0.0 "$n5 label Client5"
$ns at 0.0 "$n6 label Client6"
$ns at 0.0 "$n7 label Client7"
$ns at 0.0 "$n8 label Client8"

#Orient
$ns duplex-link-op $n0 $n1 orient up
$ns duplex-link-op $n0 $n2 orient up-right
$ns duplex-link-op $n0 $n3 orient right
$ns duplex-link-op $n0 $n4 orient down-right
$ns duplex-link-op $n0 $n5 orient down
$ns duplex-link-op $n0 $n6 orient down-left
$ns duplex-link-op $n0 $n7 orient left
$ns duplex-link-op $n0 $n8 orient up-left


#Coloring the link
$ns duplex-link-op $n0 $n1 color red
$ns duplex-link-op $n0 $n2 color blue
$ns duplex-link-op $n0 $n3 color green
$ns duplex-link-op $n0 $n4 color yellow
$ns duplex-link-op $n0 $n5 color violet
$ns duplex-link-op $n0 $n6 color pink
$ns duplex-link-op $n0 $n7 color brown
$ns duplex-link-op $n0 $n8 color white


#Specifying the start and stop time 
$ns at 0.5 "$ftp start"
$ns at 4.5 "$ftp stop"
$ns at 0.5 "$ftp1 start"
$ns at 4.5 "$ftp1 stop"
$ns at 0.5 "$ftp2 start"
$ns at 4.5 "$ftp2 stop"
$ns at 0.5 "$ftp3 start"
$ns at 4.5 "$ftp3 stop"
$ns at 0.5 "$ftp4 start"
$ns at 4.5 "$ftp4 stop"
$ns at 0.5 "$ftp5 start"
$ns at 4.5 "$ftp5 stop"
$ns at 0.5 "$ftp6 start"
$ns at 4.5 "$ftp6 stop"
$ns at 0.5 "$ftp7 start"
$ns at 4.5 "$ftp7 stop"
$ns at 5.0 "finish"

#Start simulation
$ns run

