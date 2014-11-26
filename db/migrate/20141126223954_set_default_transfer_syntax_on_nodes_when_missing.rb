class SetDefaultTransferSyntaxOnNodesWhenMissing < ActiveRecord::Migration
  class Node < ActiveRecord::Base
  end

  class TransferSyntax < ActiveRecord::Base
  end

  def up
    Node.reset_column_information
    TransferSyntax.reset_column_information
    explicit_little_endian = TransferSyntax.find_or_initialize_by(value: 0)
    explicit_little_endian.update!(name: 'Explicit Little Endian')
    Node.where(transfer_syntax_id: nil).
      update_all(transfer_syntax_id: explicit_little_endian.id)
  end

  def down
    # Nothing to do here.
  end
end
