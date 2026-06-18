Add-Type -AssemblyName System.Drawing

$OutDir = Join-Path $PSScriptRoot "..\assets\part1"
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$Scenes = @(
  @{ Slug="conference-room"; Place="conference room"; Action="schedule" },
  @{ Slug="warehouse"; Place="warehouse"; Action="boxes" },
  @{ Slug="hotel-lobby"; Place="hotel lobby"; Action="client" },
  @{ Slug="train-station"; Place="train station"; Action="schedule" },
  @{ Slug="office-kitchen"; Place="office kitchen"; Action="laptop" },
  @{ Slug="copy-center"; Place="copy center"; Action="equipment" },
  @{ Slug="airport-gate"; Place="airport gate"; Action="schedule" },
  @{ Slug="retail-store"; Place="retail store"; Action="products" }
)

function Brush($hex) {
  return [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml($hex))
}

function Pen($hex, $width = 1) {
  return [System.Drawing.Pen]::new([System.Drawing.ColorTranslator]::FromHtml($hex), $width)
}

function Fill-RoundRect($g, $brush, $x, $y, $w, $h, $r) {
  $path = [System.Drawing.Drawing2D.GraphicsPath]::new()
  $d = $r * 2
  $path.AddArc($x, $y, $d, $d, 180, 90)
  $path.AddArc($x + $w - $d, $y, $d, $d, 270, 90)
  $path.AddArc($x + $w - $d, $y + $h - $d, $d, $d, 0, 90)
  $path.AddArc($x, $y + $h - $d, $d, $d, 90, 90)
  $path.CloseFigure()
  $g.FillPath($brush, $path)
  $path.Dispose()
}

function Draw-Base($g) {
  $g.Clear([System.Drawing.ColorTranslator]::FromHtml("#edf4f1"))
  Fill-RoundRect $g (Brush "#f8fbf8") 45 76 1190 570 36
  $g.FillRectangle((Brush "#d8e5df"), 45, 492, 1190, 154)
  $g.DrawLine((Pen "#d4dfda" 13), 80, 176, 1200, 176)
  $g.DrawLine((Pen "#b8c8c3" 8), 45, 646, 1235, 646)
}

function Draw-Person($g) {
  $g.FillEllipse((Brush "#a6b7b2"), 485, 607, 260, 34)
  $g.FillEllipse((Brush "#8b5a42"), 560, 208, 100, 100)
  $g.FillPolygon((Brush "#0e766e"), @(
    [System.Drawing.Point]::new(556, 340),
    [System.Drawing.Point]::new(668, 340),
    [System.Drawing.Point]::new(706, 508),
    [System.Drawing.Point]::new(520, 508)
  ))
  $g.DrawLine((Pen "#8b5a42" 21), 540, 392, 474, 476)
  $g.DrawLine((Pen "#8b5a42" 21), 684, 392, 760, 468)
  $g.DrawLine((Pen "#2d4f4b" 24), 578, 508, 578, 616)
  $g.DrawLine((Pen "#2d4f4b" 24), 655, 508, 655, 616)
}

function Draw-Props($g, $place) {
  switch ($place) {
    "conference room" {
      Fill-RoundRect $g (Brush "#9a6749") 192 490 832 140 26
      Fill-RoundRect $g (Brush "#46656c") 264 420 112 110 12
      Fill-RoundRect $g (Brush "#46656c") 800 420 116 110 12
      Fill-RoundRect $g (Brush "#d9e6e1") 1040 240 192 290 18
    }
    "warehouse" {
      $g.FillRectangle((Brush "#c9922b"), 112, 416, 176, 176)
      $g.FillRectangle((Brush "#d9aa4d"), 312, 368, 202, 224)
      $g.FillRectangle((Brush "#c9922b"), 988, 348, 186, 244)
      $g.DrawLine((Pen "#b3c3bf" 11), 76, 260, 1180, 260)
      $g.DrawLine((Pen "#b3c3bf" 11), 76, 340, 1180, 340)
    }
    "hotel lobby" {
      Fill-RoundRect $g (Brush "#b85c38") 752 390 400 176 18
      Fill-RoundRect $g (Brush "#f3dfbd") 816 290 272 140 18
      $g.FillEllipse((Brush "#f1cf72"), 180, 160, 120, 120)
      Fill-RoundRect $g (Brush "#6e8f89") 128 460 288 132 34
    }
    "train station" {
      $g.DrawLine((Pen "#42545a" 20), 112, 616, 1180, 616)
      $g.DrawLine((Pen "#6f7d80" 13), 192, 616, 432, 406)
      $g.DrawLine((Pen "#6f7d80" 13), 592, 616, 704, 406)
      Fill-RoundRect $g (Brush "#d9e6e1") 144 240 400 180 20
      Fill-RoundRect $g (Brush "#46656c") 672 284 416 108 16
    }
    "office kitchen" {
      Fill-RoundRect $g (Brush "#d7e1dc") 752 330 344 260 18
      Fill-RoundRect $g (Brush "#ffffff") 800 390 102 104 12
      Fill-RoundRect $g (Brush "#9a6749") 136 472 448 124 16
      $g.FillEllipse((Brush "#c9922b"), 300, 400, 76, 76)
    }
    "copy center" {
      Fill-RoundRect $g (Brush "#d7e1dc") 776 330 328 264 18
      Fill-RoundRect $g (Brush "#ffffff") 832 240 192 144 12
      Fill-RoundRect $g (Brush "#78928e") 816 450 236 90 12
      $g.DrawLine((Pen "#b3c3bf" 16), 144, 260, 512, 260)
      $g.DrawLine((Pen "#b3c3bf" 16), 144, 330, 512, 330)
      $g.DrawLine((Pen "#b3c3bf" 16), 144, 400, 448, 400)
    }
    "airport gate" {
      Fill-RoundRect $g (Brush "#46656c") 124 430 144 116 20
      Fill-RoundRect $g (Brush "#46656c") 284 430 144 116 20
      Fill-RoundRect $g (Brush "#46656c") 444 430 144 116 20
      $g.FillPolygon((Brush "#d9e6e1"), @(
        [System.Drawing.Point]::new(752,320),
        [System.Drawing.Point]::new(1088,396),
        [System.Drawing.Point]::new(752,472),
        [System.Drawing.Point]::new(812,396)
      ))
      Fill-RoundRect $g (Brush "#d9aa4d") 140 224 288 116 16
    }
    "retail store" {
      Fill-RoundRect $g (Brush "#d7e1dc") 800 240 256 380 18
      $g.DrawLine((Pen "#9fb2ad" 13), 832, 330, 1024, 330)
      $g.DrawLine((Pen "#9fb2ad" 13), 832, 430, 1024, 430)
      $g.DrawLine((Pen "#9fb2ad" 13), 832, 530, 1024, 530)
      Fill-RoundRect $g (Brush "#f3dfbd") 132 390 416 224 20
      $g.FillEllipse((Brush "#b85c38"), 224, 340, 56, 56)
      $g.FillEllipse((Brush "#0e766e"), 336, 340, 56, 56)
    }
  }
}

function Draw-Action($g, $action) {
  switch ($action) {
    "schedule" {
      Fill-RoundRect $g (Brush "#fffdf8") 570 350 100 96 7
      $g.DrawRectangle((Pen "#70827e" 5), 570, 350, 100, 96)
      $g.DrawLine((Pen "#70827e" 6), 590, 382, 646, 382)
      $g.DrawLine((Pen "#70827e" 6), 590, 412, 636, 412)
    }
    "equipment" {
      Fill-RoundRect $g (Brush "#d7e1dc") 540 360 144 156 14
      $g.DrawRectangle((Pen "#70827e" 6), 540, 360, 144, 156)
      $g.DrawLine((Pen "#70827e" 11), 560, 510, 526, 580)
      $g.DrawLine((Pen "#70827e" 11), 672, 510, 708, 580)
    }
    "boxes" {
      $g.FillRectangle((Brush "#d9aa4d"), 536, 380, 132, 148)
      $g.DrawLine((Pen "#a66d28" 8), 536, 448, 668, 448)
      $g.DrawLine((Pen "#a66d28" 8), 602, 380, 602, 528)
    }
    "client" {
      $g.FillEllipse((Brush "#8b5a42"), 728, 248, 80, 80)
      Fill-RoundRect $g (Brush "#b85c38") 700 352 104 168 34
    }
    "products" {
      Fill-RoundRect $g (Brush "#f3dfbd") 528 420 156 124 12
      $g.FillEllipse((Brush "#0e766e"), 568, 382, 52, 52)
      $g.FillEllipse((Brush "#c9922b"), 640, 382, 52, 52)
    }
    default {
      Fill-RoundRect $g (Brush "#ffffff") 544 376 154 116 12
      $g.DrawRectangle((Pen "#70827e" 6), 544, 376, 154, 116)
      $g.FillRectangle((Brush "#70827e"), 596, 492, 54, 40)
    }
  }
}

foreach ($Scene in $Scenes) {
  $Bitmap = [System.Drawing.Bitmap]::new(1280, 720)
  $Graphics = [System.Drawing.Graphics]::FromImage($Bitmap)
  $Graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  Draw-Base $Graphics
  Draw-Props $Graphics $Scene.Place
  Draw-Person $Graphics
  Draw-Action $Graphics $Scene.Action
  $Path = Join-Path $OutDir "$($Scene.Slug).png"
  $Bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
  $Graphics.Dispose()
  $Bitmap.Dispose()
  Write-Output $Path
}
