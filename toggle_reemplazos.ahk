#Requires AutoHotkey v2.0
#SingleInstance Force

global HotOn := true  ; estado inicial: ACTIVADO

; ---------- Hotkeys ----------
^+l:: {                       ; Ctrl+Shift+L -> ON/OFF
    global HotOn
    HotOn := !HotOn
    TrayTip "Reemplazos", HotOn ? "🟢 ACTIVADOS" : "🔴 DESACTIVADOS", "Iconi"
}

^!q:: ExitApp                 ; Ctrl+Alt+Q -> salir

; ---------- Hotstrings (quedan condicionados por HotOn) ----------
#HotIf HotOn                  ; <-- si HotOn = true, están activos
::q::que
::xq::porque
::k::que
::t::te
::l::el
::ll::la
::mkk::Mejora el siguiente prompt de formato markdown en código RAW:
::G::{#}
::GG::{##}
::GGG::{###}
::d::de
::m::me
::n::en
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
::x::por
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
::cl::Claudia
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
::mm::mecánica de los materiales
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
::OE::Ocean Engineering
::v::vino
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
::qtl::que tal
::vqv::va que va
::vqvq::va que va
::vqvg::va que va, gracias
::vqvmg::va que va, muchas gracias
::ds::data science
::cd::Ciencia de datos
#HotIf                        ; <-- fin de la condición
