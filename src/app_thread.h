#ifndef __APP_THREAD_H__
#define __APP_THREAD_H__

#include <wx/wxprec.h>
#ifndef WX_PRECOMP
#include <wx/wx.h>
#endif

class AppThread : public wxThread, public wxThreadHelper {
protected:
    ExitCode Entry() override;
public:
    using wxThread::wxThread;
};

#endif