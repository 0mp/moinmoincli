# NAME

**moinmoincli** - edit existing MoinMoin wiki pages from a command line

# SYNOPSIS

**moinmoincli**
\[**-hquv**]
\[**-f**&nbsp;*textfile*]
\[**-n**&nbsp;*username*]
\[**-t**&nbsp;*target*]
\[*selector*]

# DESCRIPTION

**moinmoincli**
is an interactive utility to edit existing MoinMoin wiki pages from
a command line.
**moinmoincli**
was only tested with the
FreeBSD
Wiki
which is using the MoinMoin engine.
The
FreeBSD
Wiki address is also hard-coded into
**moinmoincli**
as the default web service the utility works with.

**moinmoincli**
cannot create new wiki pages.

When
**moinmoincli**
is run in order to update a wiki page, a diff is presented to the
user to confirm the changes.
It is done by providing a comment describing the changes.
Next, a summary and the action menu is displayed.
The summary includes the username, the target, the comment, and the
text file name.
Actions that could be entered at the action menu prompt are
described in the
*ACTION MENU*
subsection.
Once the user confirms requested changes to be processed, the password prompt
is presented to the user.

## Command-line options

The options are as follows:

**-f** *textfile*, **--file** *textfile*

> Point to the
> Ar textfile
> that is going to be sent to the server.

**-h**, **--help**

> Show help.

**-n** *username*, **--name** *username*

> Set the username to log in as.

**-q**, **--quick**

> Activate the quick mode, which disables the action menu.
> As a result the changes will be uploaded once a comment is entered
> by the user.

**-t** *target*, **--target** *target*

> Provide the name of the wiki page to be updated, e.g.:
> "`/WiFi/80211ac`".
> A hyperlink is acceptable as well, e.g.:
> "`https://wiki.freebsd.org/WiFi/80211ac`".

**-u**, **--update**

> Download the contents of the
> *target*
> wiki page and put them into the

**-v**, **--version**

> Show version.

*selector*

> Run
> **moinmoincli**
> as preconfigured for a given
> *selector*.

> Selectors are used if the
> **select\_target**()
> function is defined in the
> configuration file (defaults are listed in the
> *FILES*
> section).
> A single
> *selector*
> is associated with a
> *target*
> and a
> *textfile*.
> As a result it is possible to use selectors to replace
> "`moinmoincli -f ./80211ac.moin -t /WiFi/80211ac`"
> with
> "`moinmoincli ac`"
> using an
> **ac**
> selector.

## Action menu

The following actions could be entered at the action menu prompt one
action at a time:

**y**, **k**

> Confirm changes.
> The action menu will be closed and the changes uploaded to the server.

**n**, **a**

> Abort.
> Close
> **moinmoincli**
> immediately.

**t**

> Mark changes as trivial so that subscribers to the modified wiki
> page are not notified.

**c**

> Change the comment.

**d**

> Show the diff.

**s**

> Print the summary.

# FILES

*~/.moinmoincli.conf*

> The
> **moinmoincli**
> configuration file.

*/tmp/moinmoincli-workdir*

> The location of temporary files.

# EXAMPLES

## Example 1: Downloading Wiki Pages

Download the code of
*https://wiki.freebsd.org/Community/Dogs*
and save it under
*./dogs.moinmoin*:

	$ moinmoincli --file ./dogs.moinmoin --target /Community/Dogs --update

## Example 2: Uploading Wiki Pages

Write
*./sandbox.txt*
to
*https://wiki.freebsd.org/WikiSandBox*
as
*CharlieRoot*:

	$ moinmoincli -n CharlieRoot -f ./sandbox.txt -t /WikiSandBox

## Example 3: Suggested Workflow

1.	Configure
	*~/.moinmoincli.conf*
	so that it is not necessary to specify the username, the text file name and the
	target website every time.
	Use selectors for that.

2.	Grab the latest version of the wiki page with a selector:

		$ moinmoincli -u selectorYouHaveConfigured

3.	Edit the text file.

4.	Push the changes over to the wiki server with:

		$ moinmoincli selectorYouHaveConfigured

## Configuration File

	# The username to use when logging in.
	name='CharlieRoot'
	
	# The password for the account.
	password='secret'
	
	# The default target.
	# It is used unless a selector or the -t flag is used.
	target='/WikiSandBox'
	
	# The default textfile.
	textfile='/tmp/wiki.moin'
	
	# The select_target function, which defines the logic behind
	# selectors.
	select_target() {
	    case "$1" in
	        [wW]*)
	            target='/WiFi'
	            textfile="$HOME/wifi.moin"
	            ;;
	        *)
	            printf '%s\n' "invalid selector '$1'" >&2
	            ;;
	    esac
	}

# AUTHORS

**moinmoincli**
and its manual page was written by
Mateusz Piotrowski &lt;[0mp@FreeBSD.org](mailto:0mp@FreeBSD.org)&gt;.
