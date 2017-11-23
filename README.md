Compiling on Windows
====================

### Requirements

You need:

* A recent version of CMake.  I use 3.9.3.
* A recent version of wxWidgets.  I use 3.1.0.

  If you are building your own version of wx, keep in mind that your build
  must either enable `wxUSE_IPV6` or disable `wxUSE_SOCKETS`.  I recommend
  the latter, as lyirc uses asio for servicing sockets.