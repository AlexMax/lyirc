#ifndef __MAIN_FRAME_H__
#define __MAIN_FRAME_H__

#include "main_frame_base.h"

#include "../view/main_view.h"

class MainFrame : public MainFrameBase {
    MainView view;
public:
    MainFrame(wxWindow* parent);
};

#endif
