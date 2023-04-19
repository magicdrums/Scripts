#! /usr/bin/python
 
from netaddr import *
from optparse import OptionParser
 
parser = OptionParser()
parser.add_option("-s", "--start-mac", dest="start_mac",
help="The starting MAC address, inclusive.", metavar="START-MAC")
parser.add_option("-n", "--number", dest="number", type="int",
help="The number of MAC addresses to generate.", metavar="NUMBER")
(options, args) = parser.parse_args()
 
# All uppercase Unix style mac address formatter
class mac_custom(mac_unix): pass
mac_custom.word_fmt = '%.2X'
 
mac = EUI(options.start_mac, dialect=mac_custom)
 
for _ in range(options.number):
print mac
mac = EUI( int(mac) + 1, dialect=mac_custom)
