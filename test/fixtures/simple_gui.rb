#!/usr/bin/env ruby
# frozen_string_literal: true

require "gir_ffi-gtk3"

Gtk.init

class Application
  def initialize
    setup_gui
    connect_signals
    @win.show_all
  end

  def run
    Gtk.main
  end

  private

  def connect_signals
    connect_click_signal
    connect_destroy_signal
  end

  def connect_destroy_signal
    @win.signal_connect("destroy") { Gtk.main_quit }
  end

  def connect_click_signal
    @button.signal_connect("clicked") { @win.destroy }
  end

  def setup_gui
    @win = Gtk::Window.new :toplevel
    @box = Gtk::Box.new :vertical, 0
    @box.add Gtk::Label.new "Hello, World!"
    @button = Gtk::Button.new_with_label "Close"
    @box.add @button
    @win.add @box
  end
end

Application.new.run
