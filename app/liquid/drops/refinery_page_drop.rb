class Refinery::PageDrop < Clot::BaseDrop

  self.liquid_attributes = [:created_at, :updated_at, :id, :title, :slug, :parts]

end