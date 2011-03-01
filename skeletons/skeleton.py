# -*- coding: utf-8 -*-
#
# File: .py
#
# Copyright (c) nexiles GmbH
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

__author__    = """Stefan Eletzhofer <se@nexiles.de>"""
__docformat__ = 'plaintext'
__revision__  = "$Revision: $"
__version__   = '$Revision: $'[11:-2]


import sys
import os
import logging

LOGGER=""
def info(msg):
    logging.getLogger(LOGGER).info(msg)

def debug(msg):
    logging.getLogger(LOGGER).debug(msg)

def error(msg):
    logging.getLogger(LOGGER).error(msg)

if __name__ == "__main__":
    import doctest
    import unittest
    suite = doctest.DocFileSuite("skeleton.txt",
                                 optionflags=doctest.ELLIPSIS + doctest.REPORT_ONLY_FIRST_FAILURE )
    unittest.TextTestRunner().run(suite)

    

# vim: set ft=python ts=4 sw=4 expandtab :
