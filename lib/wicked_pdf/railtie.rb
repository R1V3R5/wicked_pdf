class WickedPdfRailtie < Rails::Railtie

  initializer 'wicked_pdf.configure_rails_initialization' do
    ActionController::Base.send :include, PdfHelper
    ActionView::Base.send :include, WickedPdfHelper::Assets
    if Mime::Type.lookup_by_extension(:pdf).nil?
      Mime::Type.register('application/pdf', :pdf)
    end
  end
end
require 'wicked_pdf/pdf_helper'
require 'wicked_pdf/wicked_pdf_helper'
