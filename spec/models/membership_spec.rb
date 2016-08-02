# coding: utf-8
require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe :role do
    context :owner do
      context :writer do
        let(:membership){ Membership.new }
        it{ membership.role = 1 }
        it{ membership.role = '1' }
        it{ membership.role = :owner }
        it{ membership.role = 'owner' }
      end
      context :assign do
        let(:membership){ @membership }
        it{ @membership = Membership.new(role: 1) }
        it{ @membership = Membership.new(role: '1') }
        it{ @membership = Membership.new(role: :owner) }
        it{ @membership = Membership.new(role: 'owner') }
      end
      after{ expect(membership.role).to eq 'owner' }
    end
    context :writer do
      context :writer do
        let(:membership){ Membership.new }
        it{ membership.role = 2 }
        it{ membership.role = '2' }
        it{ membership.role = :writer }
        it{ membership.role = 'writer' }
      end
      after{ expect(membership.role).to eq 'writer' }
    end
    context :reader do
      context :owner do
        let(:membership){ Membership.new(role: 1) }
        it{ expect(membership.role == 1      ).to be_truthy }
        it{ expect(membership.role_before_type_cast == 1).to be_truthy }
        it{ expect(membership.role == '1'    ).to be_falsy  }
        it{ expect(membership.role == 'owner').to be_truthy }
        it{ expect(membership.role == :owner ).to be_truthy }
        it{ expect(membership.role == 2       ).to be_falsy }
        it{ expect(membership.role == '2'     ).to be_falsy }
        it{ expect(membership.role == 'writer').to be_falsy }
        it{ expect(membership.role == :writer ).to be_falsy }
      end
    end
  end
end
