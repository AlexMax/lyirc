#include "main_frame.h"

MainFrame::MainFrame(wxWindow* parent) : MainFrameBase(parent), view(MainView()) {
    wxTextAttr attr;
    attr.SetFontFaceName("Consolas");
    attr.SetTextColour(*wxWHITE);
    attr.SetBackgroundColour(*wxBLACK);

    this->output->SetDefaultStyle(attr);
    this->output->SetBackgroundColour(*wxBLACK);

    for (int i = 0;i < 50;i++) {
        this->output->AppendText("[23:40:23] ");

        attr.SetTextColour(*wxBLUE);
        this->output->SetDefaultStyle(attr);

        this->output->AppendText("<");

        attr.SetTextColour(*wxWHITE);
        this->output->SetDefaultStyle(attr);

        this->output->AppendText("Tribeam");

        attr.SetTextColour(*wxBLUE);
        this->output->SetDefaultStyle(attr);

        this->output->AppendText(">");

        attr.SetTextColour(*wxWHITE);
        this->output->SetDefaultStyle(attr);

        this->output->AppendText(" Spy around here(hey boys its a spy).Spy sapping my sentry!Spy sapping my teleporter!Damnit, Damnit, Damnit!\n");
    }

    this->Show();
}
