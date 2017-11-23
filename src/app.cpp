#include "app_thread.h"
#include "gui/main_frame.h"

#include <wx/wxprec.h>
#ifndef WX_PRECOMP
#include <wx/wx.h>
#endif

class App : public wxApp {
    AppThread appThread;
public:
    App() : appThread(wxTHREAD_DETACHED) { }
    bool OnInit() override;
};

bool App::OnInit() {
    if (this->appThread.Create() != wxTHREAD_NO_ERROR) {
        return false;
    }

    auto frame = new MainFrame(NULL);
    return true;
}

wxIMPLEMENT_APP(App);
