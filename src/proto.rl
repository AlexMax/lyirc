%%{
    machine irc;

# Actions

    action mark {
        // printf("mark %ld\n", fpc - buffer);
        parser->mark = fpc;
    }

    action write_prefix {
        // printf("write prefix %ld\n", fpc - buffer);
        parser->prefix = parser->mark;
        parser->prefix_end = fpc;
    }

    action write_command {
        // printf("write command %ld\n", fpc - buffer);
        parser->command = parser->mark;
        parser->command_end = fpc;
    }

    action write_param {
        // printf("write param %ld\n", fpc - buffer);
        parser->params[parser->params_count].param = parser->mark;
        parser->params[parser->params_count].param_end = fpc;
    }

    action bom {
        // printf("begin! %ld\n", fpc - buffer);
        memset(parser, 0, sizeof(IRCParser));
    }

    action eom {
        // printf("done! %ld\n", fpc - buffer);
        fbreak;
    }

# Grammar - Terminals
    NOSPCRLFCL = [^\0\r\n :];
    SPACE = ' '+;
    CRLF = '\r\n';
# Grammar - Non-terminals
    prefix = ( ':' graph+ ) >mark %write_prefix;

    command = ( alpha+ | digit{3} ) >mark %write_command;

# Middle paramters may not have spaces and may not start with a colon
    middle = ( NOSPCRLFCL ( ':' | NOSPCRLFCL )* ) >mark %write_param;
# Trailing parameter may have spaces and must start with a colon
    trailing = ( ':' | SPACE | NOSPCRLFCL )* >mark %write_param;

    params =
        ( ( SPACE middle ){,13} ( SPACE ':' trailing )? ) |
        ( ( SPACE middle ){14} ( SPACE ':'? trailing )? );

    message = ( ( prefix SPACE )? command params? CRLF ) >bom %eom;

    main := message;

}%%

%% write data;

#include <array>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct IRCParam {
    char* param;
    char* param_end;
};

struct IRCParser {
    char* mark;
    char* prefix;
    char* prefix_end;
    char* command;
    char* command_end;
    std::size_t params_count;
    std::array<IRCParam, 15> params;
};

static char buffer[11894784];

int test() {
    IRCParser* parser = new IRCParser();
//  char buffer[11894784];

    FILE* fh = fopen("ircproto.txt", "rb");
    size_t read = fread(buffer, 1, sizeof(buffer), fh);

    int cs; // Current state
    char* p = buffer;
    char* pe = buffer + read;
    char* eof = NULL;

    while (pe != p) {
        %% write init;
        %% write exec;

//      printf("cs: %d p: %p, pe: %p (%ld), eof: %p\n", cs, p, pe, p - buffer, eof);
    }
    printf("cs: %d p: %p, pe: %p (%ld), eof: %p\n", cs, p, pe, p - buffer, eof);

    delete parser;
    fclose(fh);

    return 0;
}