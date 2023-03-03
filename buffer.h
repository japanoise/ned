#ifndef NED_BUFFER_H
#define NED_BUFFER_H

typedef struct line {
        struct line *prev;
        struct line *next;
        char *data;
        int len;
} line;

typedef struct buffer {
        line *lines;
        line *cur;
} buffer;

#endif
