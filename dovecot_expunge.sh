#!/bin/bash
# which doveadm
DOVEADM="/usr/bin/doveadm";

$DOVEADM expunge -A mailbox Trash savedbefore 60d
