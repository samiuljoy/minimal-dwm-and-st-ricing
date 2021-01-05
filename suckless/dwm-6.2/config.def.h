/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
/* static const unsigned int gappx  = 6;	gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "Fira Code Medium:size=10.5:antialias=true:autohint=false" };
static const char dmenufont[]       = "Fira Code Medium:size=10.5:antialias=true:autohint=false";
static const int focusonwheel       = 1;
static const char col_gray1[]       = "#282a36";
static const char col_gray2[]       = "#282a36";
static const char col_gray3[]       = "#adadad";
static const char col_gray4[]       = "#d7d7d7";
static const char col_cyan[]        = "#adadad";
static const char col_joy1[]        = "#778899";
static const char col_joy2[]        = "#10101c";
static const char col_joy3[]        = "#151525";
static const char col_black[]       = "#000000";
static const char col_sb[]          = "#444555";
static const char col_db[]          = "#002e43";
static const char col_inactive1[]   = "#4f2f2d";
/* static const char col_inactive2[]    = "#2D4F43"; */
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_joy3, col_inactive1 },
	[SchemeSel]  = { col_gray4, col_black,  col_joy1 },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class	instance	title		tags mask	isfloating	monitor */
	{ "Gimp",	NULL,		NULL,		0,		1,		-1 },
	{ "Firefox",	NULL,		NULL,		1 << 2,		0,		-1 },
	{ "st",		NULL,		"ManGo",	0,		1,		-1 },
	{ "st",		NULL,		"moocp",	0,		1,		-1 },
	{ "st",		NULL,		"Nooice",	0,		1,		-1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "(^-^)",      tile },    /* first entry is default */
	{ "(o.o)",      NULL },    /* no layout function means floating behavior */
	{ "{-.-}",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define MOD2KEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_black, "-nf", col_gray4, "-sb", col_sb, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *web[] = { "firefox-esr", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,			XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,			XK_d,      spawn,          {.v = dmenucmd } },
/*	{0,				XK_F12,    spawn,          SHCMD("/usr/local/bin/compton-toggle.sh") }, */
	{MODKEY,			XK_F4,     spawn,          SHCMD("/usr/local/bin/notify-send-date.sh") },
	{MODKEY,			XK_F3,     spawn,          SHCMD("/usr/local/bin/notify-send-temp.sh") },
	{0,				XK_F9,     spawn,          SHCMD("/usr/local/bin/notify-send-vup.sh") },
	{0,				XK_F8,     spawn,          SHCMD("/usr/local/bin/notify-send-vdown.sh") },
	{0,				XK_F10,    spawn,          SHCMD("/usr/local/bin/notify-send-mute-toggle.sh") },
	{0,				XK_Print,  spawn,          SHCMD("scrot") },
	{ MODKEY,			XK_g,      spawn,          SHCMD("st -T Nooice -e nnn -l"), },
	{ MOD2KEY,			XK_Return, spawn,          SHCMD("st -T ManGo") },
	{ MOD2KEY,			XK_p,      spawn,          SHCMD("st -T moocp -e mocp -T yellow_red_theme") },
	{ MODKEY|ShiftMask,		XK_e,      spawn,          SHCMD("/usr/local/bin/exit-prompt.sh") },
	{ MODKEY,			XK_Home,   spawn,          {.v = web } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,			XK_Down,   focusstack,     {.i = +1 } },
	{ MODKEY,			XK_Up,     focusstack,     {.i = -1 } },
	{ MODKEY,			XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,			XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,			XK_Left,   focusstack,     {.i = -0.05} },
	{ MODKEY,			XK_Right,  focusstack,     {.i = +0.05} },
	{ MODKEY,			XK_h,      focusstack,     {.i = -0.05} },
	{ MODKEY,			XK_l,      focusstack,     {.i = +0.05} },
	{ MODKEY|ShiftMask,             XK_Left,   setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_Right,  setmfact,       {.f = +0.05} },
	{ MODKEY|ControlMask,		XK_Return, zoom,           {0} },
	{ MOD2KEY,			XK_Tab,    view,           {0} },
	{ MODKEY,			XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
