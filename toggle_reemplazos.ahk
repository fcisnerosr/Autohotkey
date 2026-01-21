#Requires AutoHotkey v2.0
#SingleInstance Force

; ==========================================================
; CONFIGURACIÓN GENERAL
; ==========================================================
SetCapsLockState("AlwaysOff") ; CapsLock siempre apagado (usado para ESC)

; ==========================================================
; CONFIGURACIÓN DE GRUPOS
; ==========================================================
GroupAdd "Exclusiones", "ahk_exe mintty.exe" 

GroupAdd "GrupoTerminal", "ahk_class ConsoleWindowClass"
GroupAdd "GrupoTerminal", "ahk_exe WindowsTerminal.exe"
GroupAdd "GrupoTerminal", "ahk_exe wsl.exe"
GroupAdd "GrupoTerminal", "ahk_exe wslhost.exe"
GroupAdd "GrupoTerminal", "ahk_exe ubuntu.exe"
GroupAdd "GrupoTerminal", "ahk_exe debian.exe"
GroupAdd "GrupoTerminal", "ahk_exe conhost.exe"

global HotOn := true
global PinnedHwnd := 0
global Alpha := 220
global Step  := 20
global VSCodeChat := false 
global TerminalChat := false 

; --- Controles Generales ---
^+l:: {
    global HotOn := !HotOn
    TrayTip("Reemplazos", HotOn ? "🟢 ACTIVADOS GLOBALMENTE" : "🔴 DESACTIVADOS GLOBALMENTE", "Iconi")
}

^!q:: ExitApp

; ==========================================================
; CONTROL EXCLUSIVO PARA VS CODE
; ==========================================================
#HotIf WinActive("ahk_exe Code.exe")
!c:: { 
    global VSCodeChat := !VSCodeChat
    ToastToggle("VS Code", VSCodeChat)
}
#HotIf

; ==========================================================
; CONTROL EXCLUSIVO PARA TERMINAL / NVIM
; ==========================================================
#HotIf WinActive("ahk_group GrupoTerminal")
!c:: { 
    global TerminalChat := !TerminalChat
    ToastToggle("Terminal/Nvim", TerminalChat)
}
#HotIf

; Función auxiliar para notificaciones
ToastToggle(AppName, State) {
    if (State)
        TrayTip(AppName, "💬 Modo Chat: ACTIVADO`n(Reemplazos permitidos)", "Iconi")
    else
        TrayTip(AppName, "💻 Modo Comando: DESACTIVADO`n(Navegación segura)", "Iconi")
}

; ==========================================================
; NAVEGACIÓN VIM (GLOBAL)
; ==========================================================
CapsLock::Esc

!h::Send("{Left}")
!j::Send("{Down}")
!k::Send("{Up}")
!l::Send("{Right}")

; --- SECCIÓN DE BORRADO ---
!x::
!f::
+x::
+f::
+k::
+n::Send("{Backspace}")  ; Borra 1 caracter con Alt+X/F o Shift+X/F/K/N

!n::Send("^{Backspace}") ; Alt + N -> Borrar palabra completa

; Navegación extendida
!i::Send("{PgUp}")
!u::Send("{PgDn}")

; Manipulación por palabras
!y::Send("^{Left}")
!o::Send("^{Right}")

; ==========================================================
; REEMPLAZOS
; ==========================================================
#HotIf HotOn and (!WinActive("ahk_group Exclusiones") and !WinActive("ahk_exe Code.exe") and !WinActive("ahk_group GrupoTerminal")) 
    or (HotOn and WinActive("ahk_exe Code.exe") and VSCodeChat)
    or (HotOn and WinActive("ahk_group GrupoTerminal") and TerminalChat)

#Hotstring T

; --- TUS HOTSTRINGS ---
::edo::estado
::n::en
::g::#
::gg::##
::x::por
::q::que
::l::el
::cl::Claudia
::xq::porque
::k::que
::t::te
::ll::la
::mkk::Mejora el siguiente prompt de formato markdown en código RAW:
::G::#
::GG::##
::GGG::###
::d::de
::m::me
::xk::porque
::too::todo
::bn::bien
::fcisn::fcisneros@outlook.es
::tms::Toastmasters
::qe::que
::gr::gracias
::mg::muchas gracias
::mgr::muchas gracias
::c::se
::tmbn::también
::stoy::estoy
::nc::no se
::cm::como
::pq::porque
::s::es
::ms::más
::xc::por cierto
::bbe::bebé
::bb::bebé
::sta::está
::aora::ahora
::bd::buenos días
::Bd::Buenos días
::TM::Toastmasters
::tm::Toastmasters
::tt::Table Topics
::TT::Table Topics
::sig::siguiente
::sig.::siguiente
::dd::de
::porqe::porque
::min::minuto
::min.::minuto
::mins::minutos
::mins.::minutos
::hr::hora
::hr.::hora
::hrs::horas
::hrs.::horas
::ud::usted
::uds::ustedes
::qtl::Que tal
::wha::Whastapp
::naa::nada
::mak::en formato markdown en código RAW
::dl::del
::qos::que ondas
::paraq::para que
::paq::para que
::paqe::para que
::pake::para que
::pa::para
::oa::ok amor
::qeda::queda
::ntp::no te preocupes
::ent::entonces
::what::Whastapp
::r::ir
::sq::es que
::yy::ya
::kk::ok
::vr::ver
::cel::celular
::dq::de que
::desicion::decisión
::desición::decisión
::loq::lo que
::gpp::ChatGPT
::gp::ChatGPT
::gpt::ChatGPT
::ed::Eduardo
::Ed::Eduardo
::yt::YouTube
::my::muy
::porq::porqe
::clau::Claudia
::bebe::bebé
::mñn::mañana
::wa::Whastapp
::wh::Whastapp
::dla::de la
::nl::en el
::pro::pero
::dsd::desde
::yaq::ya que
::ma::mi amor
::mmc::mecánica del medio continuo
::mm::mamá
::dnd::de nada
::lea::le amo
::palla::para allá
::namas::nada más
::leam::le amo
::nn::no
::cn::con
::qm::que me
::rc::Responde concretamante
::edq::es decir que
::edd::es decir
::sic::sí es cierto
::rcp::Responde concretamante y por qué
::vv::verdad
::vvv::verdad?
::bt::buenas tardes
::ig::igualmente
::mk::markdown
::toa::toda
::yq::ya que
::vz::vez
::sa::sí amor
::pps::papás
::num::número
::xf::por favor
::xfs::porfas
::ae::Análisis Estructural
::jj::jaja
::jjj::jajajaja
::jjjj::jajajajajaja
::sem::sin embargo
::smm::sin embargo
::OE::Ocean Engineering
::nv::no vino
::ss::si
::sr::ser
::ddd::😬
::nq::en qué
::sl::es el
::msn::mensaje
::ls::los
::lss::las
::toos::todos
::aa::🤗
::msnj::mensaje
::vqv::va que va
::vqvq::va que va
::vqvg::va que va, gracias
::vqvmg::va que va, muchas gracias
::ds::data science
::cons::Consulting
::mt::Microsoft Teams
::mma::mamá
::pp::papá
::ppa::papá
::qus::Qué estará pasando?
::ea::¿es así?
::ml::Machine Learning
::ago::agosto
::dddd::😄
::toas::todas
::ee::estimados estudiantes:
::h::he
::ii::\
::qb::que bueno
::deac::de acuerdo
::dh::de hecho
::sigs::siguientes
::no.::número
::noe::no entiendo
::noo::no entendí
::sn::son
::snn::sin
::dsps::después
::dpp::después
::cafe::café
::qo::que onda
::jsv::Journal of Sound and Vibration
::tl::tal
::stan::están
::eff::,¿es así?
::ckk::https://chatgpt.com
::mac::márcame
::qt::que te
::ste::este
::stee::esté
::dff::dataframe
::sept::septiembre
::sep::septiembre
::ccc::comidas fuera del hogar,
::mkkk::Mejora el siguiente prompt de formato markdown en código RAW, pero no cambies nada, solo mejora su redacción para que quede claro que lo que tiene hacer el LLM:
::mll::Machine Learning Engineer
::stado::estado
::stas::estas
::qedo::quedó
::stos::estos
::cme::se me
::sten::estén
::stén::estén
::prox::próximo
::oct::octubre
::star::estar
::cooo::comidas fuera del hogar
::yc::ya se
::tmpc::tampoco
::tmpoco::tampoco
::tmcp::tampoco
::sss::sí
::ppp::proxy RolesClubBotToastmastersFree
::staba::estaba
::xe::por ejemplo
::cq::se que
::sto::esto

#HotIf

; =========================
; Funciones de Ventana
; =========================
WinGetAlwaysOnTop(winTitle := "A") {
    return (WinGetExStyle(winTitle) & 0x8) != 0
}

#+t:: {
    global PinnedHwnd, Alpha
    try {
        PinnedHwnd := WinGetID("A")
        isTop := WinGetAlwaysOnTop("ahk_id " PinnedHwnd)
        WinSetAlwaysOnTop(!isTop, "ahk_id " PinnedHwnd)
        if (!isTop) {
            WinSetTransparent(Alpha, "ahk_id " PinnedHwnd)
        } else {
            WinSetTransparent(255, "ahk_id " PinnedHwnd)
        }
    }
}

#!Up:: {
    global PinnedHwnd, Alpha, Step
    if (PinnedHwnd) {
        Alpha := Min(255, Alpha + Step)
        WinSetTransparent(Alpha, "ahk_id " PinnedHwnd)
    }
}

#!Down:: {
    global PinnedHwnd, Alpha, Step
    if (PinnedHwnd) {
        Alpha := Max(40, Alpha - Step)
        WinSetTransparent(Alpha, "ahk_id " PinnedHwnd)
    }
}

; =========================
; Apertura de Apps
; =========================
#n::OpenNvimWSL() 
#!g::OpenBraveGemini()

OpenNvimWSL() {
    try {
        Run("wsl.exe --cd ~ nvim texto.txt") 
        if WinWaitActive("ahk_class ConsoleWindowClass", , 3) or WinWaitActive("ahk_exe wsl.exe", , 3) {
             hwnd := WinGetID("A")
             WinRestore(hwnd)
             
             w := 900
             h := 600
             
             MonitorGetWorkArea(1, &WL, &WT, &WR, &WB)
             x := WL + (WR - WL - w) / 2
             y := WT + (WB - WT - h) / 2
             WinMove(x, y, w, h, hwnd)
             global TerminalChat := true 
             TrayTip("Nvim", "Abierto: texto.txt`n(Centrado y Chat ON)", "Iconi")
        }
    } catch as e {
        MsgBox("Error al intentar abrir WSL: " e.Message)
    }
}

OpenBraveGemini() {
    global PinnedHwnd, Alpha
    try {
        Run("brave.exe --new-window https://gemini.google.com/u/1/app")
        if WinWaitActive("ahk_exe brave.exe", , 5) {
            hwnd := WinGetID("A")
            processName := WinGetProcessName("ahk_id " hwnd)
            if (processName = "brave.exe") {
                WinSetAlwaysOnTop(true, hwnd)
                WinSetTransparent(180, hwnd)
                PinnedHwnd := hwnd
                Alpha := 180
            }
        }
    }
}
