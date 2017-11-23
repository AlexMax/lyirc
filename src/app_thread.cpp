#include "app_thread.h"

#include <asio.hpp>

AppThread::ExitCode AppThread::Entry() {
    asio::io_service service;

    // Resolve an IRC server
    asio::ip::tcp::resolver resolver(service);
    asio::ip::tcp::resolver::query query("irc.zandronum.com", "6667");
    resolver.async_resolve(query, [](auto error, auto it) {
        // Connect to the IRC server
        asio::ip::tcp::socket socket(service);
        asio::async_connect(socket, it, [auto error, auto it]() {

        });
    });

    
    return 0;
}