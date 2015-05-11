require 'wicked_pdf/pdf_helper'
require 'wicked_pdf/wicked_pdf_helper'

class WickedRailtie < Rails::Railtie
  initializer 'wicked_pdf.register' do |app|
    ActionController::Base.send :include, PdfHelper
    ActionView::Base.send :include, WickedPdfHelper::Assets
  end
end




if Mime::Type.lookup_by_extension(:pdf).nil?
  Mime::Type.register('application/pdf', :pdf)
end
