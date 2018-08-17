# SPDX-License-Identifier: BSD-2-Clause
#
# Copyright (c) 2018 Mateusz Piotrowski <0mp@FreeBSD.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

PREFIX = /usr/local
BINDIR = $(DESTDIR)$(PREFIX)/bin
EXAMPLESDIR = $(DESTDIR)$(PREFIX)/share/examples/moinmoincli
MANDIR = $(DESTDIR)$(PREFIX)/man
MAN1DIR = $(MANDIR)/man1

install:
	mkdir -p $(BINDIR)
	install -m 0755 moinmoincli $(BINDIR)/moinmoincli
	mkdir -p $(MAN1DIR)
	install -m 0555 moinmoincli.1 $(MAN1DIR)/moinmoincli.1
	mkdir -p $(EXAMPLESDIR)
	install -m 0555 moinmoincli.conf.sample $(EXAMPLESDIR)/moinmoincli.conf.sample
