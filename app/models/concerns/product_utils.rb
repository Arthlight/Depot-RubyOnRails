module ProductUtils

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Product has #{line_items.count} line items referencing it, can't delete.")
      throw :abort
    end
  end
end