#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003-2009 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

scenarios(dist => 1);

foreach my $prog (
    # See also t_flag_help.pl
    "../bin/verilator",
    "../bin/verilator_coverage",
    #"../bin/verilator_difftree",
    #"../bin/verilator_gantt",
    #"../bin/verilator_profcfunc",
    ) {
    run(fails => 0,
        cmd => ["perl", $prog,
                "--version"],
        logfile => "$Self->{obj_dir}/t_help.log",
        expect => qr/^Verilator/,
        );
}

ok(1);
1;
