package Perinci::Examples::Config;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

# package metadata
$SPEC{':package'} = {
    v => 1.1,
    summary => 'Examples related to config files',
};

$SPEC{config_info} = {
    v => 1.1,
    summary => 'Show config file information',
    args => {
        arg_int1  => {schema=>'int*'},
        arg_int2  => {schema=>'int*'},
        arg_str1  => {schema=>'str*'},
        arg_str2  => {schema=>'str*'},
        arg_hash1 => {schema=>'hash*'},
    },
};
sub config_info {
    my %args = @_;

    my $cmdline = delete($args{-cmdline});

    my $r = delete($args{-cmdline_r})
        or return [412, "I am not passed -cmdline_r, please set ".
                   "Perinci::CmdLine's attribute: pass_cmdline_object"];

    [200, "OK", {
        args              => \%args,
        read_config       => $r->{read_config},
        read_config_files => $r->{read_config_files},
        config            => $r->{config},
        config_paths      => $r->{config_paths},
        config_profile    => $r->{config_profile},
    }];
}

1;
# ABSTRACT:
